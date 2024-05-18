import React from 'react';
import { ethers } from 'ethers';

const OpenLottery = ({ contract }) => {
  const handleBet = async () => {
    
    if (contract) {
      try {
        const tx = await contract.openLottery();
        await tx.wait();
        console.log('Lottery opened:', tx);
      } catch (error) {
        console.error('Error opening lottery:', error);
      }
    } else {
      console.error('Contract not loaded');
    }
  };

  return (
    <div className="flex flex-col items-center mt-8">
    <button 
      onClick={handleBet}
      className="border-2 border-black w-44 h-16 flex items-center justify-center hover:bg-gray-300 transition duration-300"
    >
      <h2>Open Lottery</h2>
    </button>
    </div>
  );
};

export default OpenLottery;
