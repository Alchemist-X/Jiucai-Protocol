import React, { useState } from 'react';
import './App.css';
import PotSize from './components/PotSize';
import Rules from './components/Rules';
import Amount from './components/Amount';
import Bet from './components/Bet';
import Referral from './components/Referral';
import ParticipantsList from './components/ParticipantsList';
import HistoryWinner from './components/HistoryWinner';

function App() {
  const [potSize, setPotSize] = useState(0.00);
  const [referral, setReferral] = useState('');
  const [participants, setParticipants] = useState(['Participant 1', 'Participant 2', 'Participant 3']);
  const [winners, setWinners] = useState(['Winner 1', 'Winner 2', 'Winner 3']);

  return (
    <div className="bg-gray-100 text-gray-900 min-h-screen flex items-center justify-center">
      <div className="max-w-md mx-auto p-4 bg-white shadow-lg rounded-lg mt-10">
        <div className="text-center mb-4">
          <PotSize potSize={potSize} />
        </div>
        <div className="text-center mb-4">
          <Rules />
        </div>
        <div className="flex justify-between mb-4">
          <Amount />
          <Bet />
        </div>
        <div className="text-center mb-4">
          <Referral referral={referral} setReferral={setReferral} />
        </div>
        <div className="flex justify-between">
          <ParticipantsList participants={participants} />
          <HistoryWinner winners={winners} />
        </div>
      </div>
    </div>
  );
}

export default App;
