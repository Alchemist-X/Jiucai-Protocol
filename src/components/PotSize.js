import React from 'react';

const PotSize = ({ potSize }) => {
  return (
    <div className="bg-gray-200 p-4 rounded-lg">
      <h2 className="text-xl font-bold">Pot Size</h2>
      <p className="text-lg">${potSize.toFixed(2)}</p>
    </div>
  );
};

export default PotSize;
