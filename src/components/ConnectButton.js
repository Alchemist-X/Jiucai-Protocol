// ConnectButton.js
import React, { useState } from 'react';
import detectEthereumProvider from '@metamask/detect-provider';
import { ethers } from 'ethers';
import { ABI } from './LotteryContract'; // 导入 ABI

const ConnectButton = ({ setContract }) => {
  const [account, setAccount] = useState(null);

  const connectMetamask = async () => {
    const provider = await detectEthereumProvider();

    if (provider) {
      try {
        const accounts = await provider.request({ method: 'eth_requestAccounts' });
        setAccount(accounts[0]);
        console.log('Connected account:', accounts[0]);

        const ethersProvider = new ethers.providers.Web3Provider(provider);
        const signer = ethersProvider.getSigner();
        const contract = new ethers.Contract('0xFcfAcfd6306Cb71D2979DC54dD6d3F7595c5af01', ABI, signer);
        setContract(contract);

        console.log('Signer:', signer);
      } catch (error) {
        console.error('User rejected the request:', error);
      }
    } else {
      console.error('Please install MetaMask!');
    }
  };

  return (
    <button
      onClick={connectMetamask}
      className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 transition duration-300"
    >
      {account ? `Connected: ${account.slice(0, 6)}...${account.slice(-4)}` : 'Connect to MetaMask'}
    </button>
  );
};

export default ConnectButton;
