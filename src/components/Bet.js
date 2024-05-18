import React from 'react';
import { ethers } from 'ethers';

const Bet = ({ contract, referral, fetchPotSize }) => {
  const handleBet = async () => {
    const referrer = referral || ethers.constants.AddressZero;
    const betAmount = ethers.utils.parseEther("0.0000996"); // 确保金额与合约中的 betAmount 一致

    if (contract) {
      try {
        const tx = await contract.placeBet(referrer, { value: betAmount });
        await tx.wait();
        console.log('Bet placed:', tx);
        fetchPotSize();
      } catch (error) {
        console.error('Error placing bet:', error);
      }
    } else {
      console.error('Contract not loaded');
    }
  };

  return (
    <button 
      onClick={handleBet}
      className="border-2 border-black w-44 h-16 flex items-center justify-center hover:bg-gray-300 transition duration-300"
    >
      <h2>Bet</h2>
    </button>
  );
};

export default Bet;
