
# Jiucai Protocol 🥬 AKA 韭菜协议 See Chinese version in README_CN.md

## Project Overview

Jiucai Protocol is an on-chain instant lottery system with referral rewards and an automated drawing mechanism. It ensures fairness and transparency while enabling viral growth.
- Rules 1. Bet 2. Wait for lottery draw 3. Refer to Earn

<div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/8a9a1ffc-c0d2-4bd3-9aee-64a5e62d0125" alt="bet1" style="width: 30%;"/>
  <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/f9a820cb-ceb4-4f4b-afa3-d0b40cfa1211" alt="Potttt" style="width: 30%;"/>
  <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/679b77ae-e2b3-4ca2-aa6e-945162f970b6" alt="refer-to-earn" style="width: 30%;"/>
</div>

## Why We Built This
- **A simple way to meet blockchain users’ needs for high-risk, high-reward, and transparent speculation**
- **Traditional lotteries have an expected return of -45%. We aim for -5% so users can enjoy the “PhD” (wordplay on gambling) experience with lower losses**

## Contributors
- Chief Contract Officer: @Willy_Qiu
- Chief Visionary Officer 🫓 + Some Frontend Work: @Alchemist-X


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

Hackathon Goals
	•	Develop smart contracts for an interoperable on-chain lottery
	•	Build a minimal frontend using React for local testing
	•	Conduct testing and track pool distributions and referral rewards on a blockchain explorer
 
## Demo 录制链接

https://www.loom.com/share/f2bc9628a3644e62af90047977c2c05d

<table>
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/746986e7-bcd8-4e9b-a51d-e208ecaa75e1" width="600" />
    </td>
    <td>
      <p>Bet Userface</p>
    </td>
  </tr>
  
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/f7d72c60-d1ef-48a3-9ec6-5506625ba5fa" width="600" />
    </td>
    <td>
      <p>Betting Signature</p>
    </td>
  </tr>
  
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/def18863-bcfb-476b-9692-3285ab774c8f" width="600" />
    </td>
    <td>
      <p>Output from terminal</p>
    </td>
  </tr>
  
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/cda3862e-8119-4e92-9201-d19bcde1dbeb" width="600" />
    </td>
    <td>
      <p>Contrac address | Interaction history</p>
    </td>
  </tr>
  
  <tr>
    <td>
      <img src="https://github.com/Alchemist-X/Jiucai-Protocol/assets/55140230/c77d3ab5-ca5d-4938-a876-3669c5a49211" width="600" />
    </td>
    <td>
      <p>Betting hisotry</p>
    </td>
  </tr>
</table>


### Testing contracts and wallet address

- Contracts https://sepolia.scrollscan.com/address/0xfcfacfd6306cb71d2979dc54dd6d3f7595c5af01
- Wallet https://sepolia.scrollscan.com/address/0xeB2b89A90D01B134268CA307F1b477086AEb989a


# User Guide

## Placing a Bet

Users place bets using crypto assets. The demo version uses Sepolia ETH, with each bet costing **0.0000996 ETH**. Each address can place up to **6 bets**. After placing a bet, users receive a **unique lottery number**.

## Lottery Draw

After the draw, the smart contract **automatically distributes** prizes based on the lottery rules.  
<span style="color:red">Winners pay the transaction fee, and non-winners receive a notification.</span>  
The platform covers the notification fee, and platform fees are sent to a **designated regulatory address**.  
Referral rewards are distributed to the respective promoters.

## Referral System

- **Parent nodes earn 2.5% and 0.5% of the betting amount from their direct and indirect referrals (children and grandchildren).**  
- Players receive a referral link with a unique code, which they can share in **Telegram groups** or other platforms.  
- If a participant **has no referrer**, the full amount (after platform fees) goes into the prize pool.  
- The referral system is **limited to two levels** (parent-child-grandchild structure).

## Lottery Rules

The lottery offers multiple mechanisms, varying in **difficulty and volatility (standard deviation)**.  
After launch, **1-2 main types** will be promoted, while others compete for growth data.

### Daily 3 Lottery (Prototype: Demo limited to 6 bets)

- **EV** = **-5%** (0.498$)  
- **Prize Pool Composition**:  
  Total Prize Pool = Player Bets - **Platform Fee (up to 2%)** - **Referral Rewards (up to 3%)** - **Blockchain Transaction Fees** + **Foundation Grant (up to 3%)**  

### Prize Distribution

A draw occurs when the **maximum number of bets (1000)** is reached or the deadline is met.  
If no **foundation grant** is provided, the total prize pool is **0.9462 ETH**.  
Winning numbers are randomly selected, and each number **can only win once**.

### Payout Structure

| Prize | Reward | Winners | Odds (1 in X) |
|-------|--------|---------|--------------|
| Grand Prize | 0.1 ETH | 3 | 333 |
| 1st Prize | 0.01 ETH | 20 | 50 |
| 2nd Prize | 0.0002 ETH | 100 | 10 |
| Consolation Prize | 0.00009848 ETH | 250 | 4 |
| No Prize | 0 ETH | 673 | 1.59 |

## Upcoming Features

- **Frontend Animation**: Large and small balls collide, some get eliminated (indicating liquidation), and the remaining balls **represent prize pool consolidation** for winners.  
- **Competitive Betting Mode**: Instead of gambling, players bet **against each other**.  
- **Viral Sharing & Rewards**: Players **share lottery tickets** to gain extra chances (e.g., multi-level marketing, earning from referrals).  
- **Micro-Betting with Wallet Change**: Automatically **combine leftover tokens** from multiple chains to place bets.

## Key Variables

### 1. User Participation

- **tonToken**: Players bet using Ton tokens.  
- **betAmount**: Fixed at $9.96 in Ton tokens.  
- **maxBetsPerAddress**: Maximum of 20 bets per address.  
- **betNumber**: Unique number assigned after placing a bet.  

### 2. Prize Pool Composition 

- **totalBets**: Total bet amount collected.  
- **platformFee**: Platform fee, **2%** of total bets.  
- **promotionReward**: Referral reward, **up to 3%** of total bets.  
- **blockchainFee**: On-chain transaction fee.  
- **foundationContribution**: Additional funds from the project team (if applicable).  

### 3. Lottery Prize Distribution 

- **maxBets**: Maximum of **1000** bets per round.  
- **lotteryOpeningTime**: Draw happens when max bets are reached or at a set time.  
- **prizePool**: Total funds available for payout, calculated as:  
  `totalBets - platformFee - blockchainFee - foundationContribution`  
- **prizes**: Prize breakdown, including grand prize, first prize, second prize, and consolation prize.  
- **grandPrize**: **Grand Prize – $1000**.  
- **firstPrize**: **First Prize – $100**.  
- **secondPrize**: **Second Prize – $20**.  
- **consolationPrize**: **Consolation Prize** – Remaining prize pool divided among winners.  

### 4. Prize Distribution

- **winners**: List of winning addresses.  
- **prizeDistribution**: Smart contract automatically distributes rewards after the draw.  
- **winnersHandlingFee**: **Transaction fees are deducted from winners' payouts**.  
- **losersAnnouncementFee**: **Platform covers the cost of notifying non-winners**.  
- **regulatoryAddress**: Platform fee is sent to a designated **regulatory address**.  

### 5. Referral Mechanism 

- **referralCode**: Custom referral link for sharing.  
- **referralReward**: Commission earned from referring players.  
- **firstLevelReward**: **2.5%** commission from direct referrals' bets.  
- **secondLevelReward**: **0.5%** commission from indirect referrals' bets.  
- **noReferrer**: If no referral code is used, **all funds go directly to the prize pool**.  
