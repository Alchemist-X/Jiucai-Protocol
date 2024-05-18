import React from 'react';

const HistoryWinner = ({ winners }) => {
  return (
    <div className="bg-gray-200 p-4 rounded-lg flex-1 ml-2">
      <h2 className="text-lg font-bold">History Winner</h2>
      <ul className="list-disc list-inside mt-2">
        {winners.map((winner, index) => (
          <li key={index}>{winner}</li>
        ))}
      </ul>
    </div>
  );
};

export default HistoryWinner;
