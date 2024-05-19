
# Jiucai Protocol 🥬 AKA 韭菜协议

## Project Overview

Jiucai Protocol 是一个链上即开型彩票协议，拥有推广返点和自动开奖机制，确保流程公平透明，有望实现裂变增长
- Rules 1. Bet 2. Wait for lottery draw 3. Refer to Earn

<div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/8a9a1ffc-c0d2-4bd3-9aee-64a5e62d0125" alt="bet1" style="width: 30%;"/>
  <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/f9a820cb-ceb4-4f4b-afa3-d0b40cfa1211" alt="Potttt" style="width: 30%;"/>
  <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/679b77ae-e2b3-4ca2-aa6e-945162f970b6" alt="refer-to-earn" style="width: 30%;"/>
</div>


## Contributing

- Chief Contract Officer 首席合约官 @Willy_Qiu
- Chief Pie Officer 首席画饼师傅 🫓 + 些许前端 @Alchemist-X


<p align="center">
  <img width="400" length="600" alt="截屏2024-05-18 21 26 25" src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/00359995-b1fa-407b-a154-a577bc670e7e">
</p>


## Installation

To set up this project locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Alchemist-X/Jiucai-Protocol.git
   cd Jiucai-Protocol
   ```

2. **Install dependencies:** 
   Make sure you have Node.js and npm installed on your machine. Then run:
   ```bash
   npm install
   ```

3. **Start the development server:**
   ```bash
   npm start
   ```

   This will run the app in development mode. Open [http://localhost:3000](http://localhost:3000) to view it in the browser. The page will reload if you make edits. You will also see any lint errors in the console.



# ETH Beijing 2024

## 黑客松目标

- 开发合约代码，实现有互操作性的链上彩票协议
- 构建本地测试所需的最低前端代码，使用React框架
- 封装测试，在区块链浏览器上观测奖池分配、推广返佣正常进行
 
## Demo 录制链接

https://www.loom.com/share/f2bc9628a3644e62af90047977c2c05d

<table>
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/746986e7-bcd8-4e9b-a51d-e208ecaa75e1" width="600" />
    </td>
    <td>
      <p>投注界面</p>
    </td>
  </tr>
  
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/f7d72c60-d1ef-48a3-9ec6-5506625ba5fa" width="600" />
    </td>
    <td>
      <p>下注签名</p>
    </td>
  </tr>
  
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/def18863-bcfb-476b-9692-3285ab774c8f" width="600" />
    </td>
    <td>
      <p>控制台输出信息</p>
    </td>
  </tr>
  
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/cda3862e-8119-4e92-9201-d19bcde1dbeb" width="600" />
    </td>
    <td>
      <p>合约地址｜交互记录</p>
    </td>
  </tr>
  
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/c77d3ab5-ca5d-4938-a876-3669c5a49211" width="600" />
    </td>
    <td>
      <p>下注记录</p>
    </td>
  </tr>
</table>


### 测试合约、钱包地址

- 合约 https://sepolia.scrollscan.com/address/0xfcfacfd6306cb71d2979dc54dd6d3f7595c5af01
- 钱包 https://sepolia.scrollscan.com/address/0xeB2b89A90D01B134268CA307F1b477086AEb989a


# 用户说明书

## 用户下注

用户使用crypto资产进行下注，演示版本使用Sepolia ETH，每注价格为 0.0000996 ETH，每个地址最多投注 6 注，完成一次投注后会获得唯一兑奖号码。

## 奖池开奖

开奖后，彩票智能合约依据“彩票规则”将奖金打向获奖的地址，手续费由获奖者承担，并向未获奖的地址发送公告，手续费由平台承担。平台手续费打入制定监管地址。推广奖励金发放至对应推广者。

## 推广裂变

父节点享受子节点和孙节点投注金额的 2.5% 和 0.5% 的推广奖励金，平台提供带有推广代码的参与链接，玩家可以自由分享在 Telegram 群聊中。若参与者没有推荐人，则无需扣除推广奖励金部分，扣除平台手续费后全部进入奖池。推广机制最多有 2 层，即父节点-子节点-孙节点。

## 彩票规则

根据逻辑实现难度、波动性（标准差）不同有多种方案，产品实际上线后会主推 1-2 种，并推流所有彩票，实施项目间赛马，观察增长数据。

### 004号 Daily 3 彩票 （一个更加完整的设计，Demo部分仅展示6注的情况

- **EV** = -5% (0.498$)
- **奖池构成**: 总奖池 = 玩家总投注金额 - 平台手续费（up to 2%）- 推广奖励金（可无，up to 3%）- 链上交易手续费 + 基金会特别拨款（充实总奖池，up to 3%）

### 奖金发放

彩票达到最大投注数（暂时规定为 1000 注）时或达到截止时间时会开奖，若无基金会拨款，此时的总奖池为为 0.9462 ETH，随机抽取中奖号码，每一号码只能中奖一次。

### 发放规则

| 结果 | 奖金 | 数量 | Odds（1 in）|
| ---- | ---- | ---- | ---------- |
| 特等奖 | 0.1e | 3 | 333 |
| 一等奖 | 0.01e | 20 | 50 |
| 二等奖 | 0.0002e | 100 | 10 |
| 安慰奖 | 0.00009848e | 250 | 4 |
| 谢谢惠顾！ | 0$ | 673 | 1.59 |


## 待开发Feature

- 前端动画设计，大球小球碰撞，部分球被吞噬（代表了该地址被清算），最后留下的大球代表奖池集中并分配给部分玩家
- 不做赌场 做竞技场 让参与人员互当对手盘
- 裂变传播，分享彩票给更多的人（转发获得额外抽奖机会、传销：享受子节点盈利
- 钱包零钱买彩票，自动整合多链代币

## 部分变量列表

### 1. 用户参与 (UserParticipation)

- **tonToken**: 用户使用 Ton 代币进行下注。
- **betAmount**: 每注下注金额固定为 9.96 美金等价值的 Ton 代币。
- **maxBetsPerAddress**: 每个地址最多投注 20 注。
- **betNumber**: 完成一次投注后，系统将为用户分配一个唯一的投注号码。

### 2. 奖池构成 (PrizePoolComposition)

- **totalBets**: 所有用户投注的总金额。
- **platformFee**: 平台手续费，占总投注金额的 2%。
- **promotionReward**: 推广奖励金，最高占总投注金额的 3%。
- **blockchainFee**: 链上交易手续费。
- **foundationContribution**: 基金会拨款金额（若有）。

### 3. 彩票发奖 (LotteryPrizeDistribution)

- **maxBets**: 最大投注数，设定为 1000 注。
- **lotteryOpeningTime**: 达到最大投注数后开奖，或在自动开奖。
- **prizePool**: 总奖池金额，计算方式为 totalBets - platformFee - blockchainFee - foundationContribution。
- **prizes**: 奖品结构，包括特等奖、一等奖、二等奖和安慰奖。
- **grandPrize**: 特等奖，奖金为 1000 美金。
- **firstPrize**: 一等奖，奖金为 100 美金。
- **secondPrize**: 二等奖，奖金为 20 美金。
- **consolationPrize**: 安慰奖，人均奖金由剩余奖池除以安慰奖人数决定。

### 4. 奖金发放 (PrizeDistribution)

- **winners**: 获奖者列表。
- **prizeDistribution**: 奖金分配机制，开奖后智能合约自动将奖金打入获奖者地址。
- **winnersHandlingFee**: 获奖者承担的链上交易手续费，将从奖金中扣除。
- **losersAnnouncementFee**: 向未获奖地址发送公告的费用，由平台承担。
- **regulatoryAddress**: 平台手续费打入的监管地址。

### 5. 推广和裂变传播机制 (PromotionMechanism)

- **referralCode**: 推广代码，用于裂变传播。
- **referralReward**: 推广奖励金，根据推广层级分配。
- **firstLevelReward**: 一级推广奖励，用户 B 投注金额的 2.5%。
- **secondLevelReward**: 二级推广奖励，用户 C 投注金额的 0.5%。
- **noReferrer**: 如果参与者没有推荐人，则不扣除推广奖励金部分，所有金额进入奖池。



