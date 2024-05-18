import React from 'react';

const ParticipantsList = ({ participants }) => {
  return (
    <div className="bg-gray-200 p-4 rounded-lg flex-1 mr-2">
      <h2 className="text-lg font-bold">Participants Lists</h2>
      <ul className="list-disc list-inside mt-2">
        {participants.map((participant, index) => (
          <li key={index}>{participant}</li>
        ))}
      </ul>
    </div>
  );
};

export default ParticipantsList;
