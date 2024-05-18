// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // 变量列表
    uint public betAmount = 0.0000996 ether; // 每注金额
    uint public maxBetsPerAddress = 6; // 每个地址最大投注数
    uint public totalBets = 0; // 总投注数
    uint public platformFeeRate = 200; // 平台手续费百分比
    uint public promotionRewardRate = 300; // 推广奖励金百分比
    uint public maxBets = 6; // 最大投注数
    uint public lotteryOpeningTime; // 开奖时间

    // 奖池构成
    uint public prizePool;
    uint public platformFee;
    uint public promotionReward;
    address public platformAddress = 0xeB2b89A90D01B134268CA307F1b477086AEb989a; // 替换为实际平台地址

    // 奖品结构
    struct Prize {
        uint amount;
        uint winnersCount;
        uint odds;
    }
    Prize[] public prizes;
    mapping(address => uint) public betNumbers; // 存储每个地址的投注号码
    address[] public winners; // 获奖者列表
    address[] public participants; // 所有参与者列表

    // 推广和裂变传播机制
    mapping(address => address) public referrals; // 存储推荐关系
    uint public firstLevelRewardRate = 25; // 一级推广奖励百分比
    uint public secondLevelRewardRate = 5; // 二级推广奖励百分比

    // 事件定义
    event BetPlaced(address indexed player, uint betNumber, uint amount);
    event LotteryOpened(uint indexed prizePool, uint timestamp);
    event PrizeWon(address indexed winner, uint prizeAmount, uint prizeType);
    event PromotionRewardDistributed(address indexed referrer, uint amount, uint level);

    // 合约部署者
    address public deployer;

    // 构造函数
    constructor() {
        deployer = msg.sender;
        prizes.push(Prize(0.00028 * 1e18, 1, 3)); // 特等奖
        prizes.push(Prize(0.000198 * 1e18, 1, 10)); // 一等奖
        prizes.push(Prize(0.000098 * 1e18, 1, 20)); // 二等奖
        // 安慰奖的奖金由剩余奖池决定，因此这里不预先定义
    }

    // 下注函数
    function placeBet(address referrer) external payable {
        require(msg.value == betAmount, "Bet amount does not match.");
        require(totalBets < maxBets, "Betting closed.");
        require(betNumbers[msg.sender] < maxBetsPerAddress, "Bet limit reached.");

        // 分配投注号码
        betNumbers[msg.sender]++;
        totalBets++;
        participants.push(msg.sender);

        // 计算平台手续费和推广奖励金
        platformFee = (totalBets * betAmount * platformFeeRate) / 10000;
        promotionReward = (totalBets * betAmount * promotionRewardRate) / 10000;

        // 更新奖池
        prizePool = totalBets * betAmount - platformFee - promotionReward;

        // 分配推广奖励金
        distributePromotionRewards(referrer);

        emit BetPlaced(msg.sender, betNumbers[msg.sender], betAmount);
    }

    // 开奖函数
    function openLottery() external payable{
        require(totalBets == maxBets, "Not enough bets to open lottery.");
        require(deployer == msg.sender, "Only the contract owner can open the lottery.");
        
        //将上一轮获奖选手归零
        delete winners;

        // 随机抽取中奖号码
        uint[] memory winningNumbers = drawWinningNumbers();

        // 更新奖池，分配奖金
        for (uint i = 0; i < winningNumbers.length; i++) {
            distributePrizes(participants[winningNumbers[i]], i);
        }

        lotteryOpeningTime = block.timestamp;
        emit LotteryOpened(prizePool, lotteryOpeningTime);

        // 将本轮奖池归零
        totalBets = 0;
        prizePool = 0;
        for (uint i = 0; i < participants.length; i++) {
            delete betNumbers[participants[i]];
            delete referrals[participants[i]];
        }
        delete participants;
    }

    // 随机抽取中奖号码函数
    function drawWinningNumbers() private view returns (uint[] memory) {
        uint[] memory winningNumbers = new uint[](prizes.length);
        for (uint i = 0; i < prizes.length; i++) {
            winningNumbers[i] = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, i))) % totalBets;
        }
        return winningNumbers;
    }

    // 奖金分配函数
    function distributePrizes(address winner, uint prizeIndex) private {
        uint prizeAmount = prizes[prizeIndex].amount;
        uint handlingFee = prizeAmount / 100; // 假设手续费为1%

        // 检查奖池是否足够支付奖金
        require(prizePool >= prizeAmount, "Insufficient prize pool");

        // 扣除手续费后发放奖金
        prizePool -= prizeAmount;
        payable(winner).transfer(prizeAmount - handlingFee);
        payable(platformAddress).transfer(handlingFee);

        // 更新获奖者列表
        winners.push(winner);

        emit PrizeWon(winner, prizeAmount, prizeIndex);
    }

    // 推广奖励金分配函数
    function distributePromotionRewards(address referrer) private {
        uint firstLevelReward = (betAmount * firstLevelRewardRate) / 1000;
        uint secondLevelReward = (betAmount * secondLevelRewardRate) / 1000;

        if (referrer != address(0)) {
            // 分配一级推广奖励
            payable(referrer).transfer(firstLevelReward);
            emit PromotionRewardDistributed(referrer, firstLevelReward, 1);

            address secondLevelReferrer = referrals[referrer];
            if (secondLevelReferrer != address(0)) {
                // 分配二级推广奖励
                payable(secondLevelReferrer).transfer(secondLevelReward);
                emit PromotionRewardDistributed(secondLevelReferrer, secondLevelReward, 2);
            } else {
                // 没有二级推荐人，则二级推广奖励进入奖池
                prizePool += secondLevelReward;
            }
        } else {
            // 没有推荐人，推广奖励金全部进入奖池
            prizePool += (firstLevelReward + secondLevelReward);
        }
    }

    // 设置推荐关系函数
    function setReferral(address referrer) external {
        require(referrals[msg.sender] == address(0), "Referral already set.");
        require(referrer != msg.sender, "Cannot refer yourself.");
        referrals[msg.sender] = referrer;
    }

    // 其他辅助函数...
    function getBetNumber(address player) external view returns (uint) {
        return betNumbers[player];
    }

    function getWinners() external view returns (address[] memory) {
        return winners;
    }

    function getPrizePool() external view returns (uint) {
        return prizePool;
    }

    function getParticipants() external view returns (address[] memory) {
        return participants;
    }
}
