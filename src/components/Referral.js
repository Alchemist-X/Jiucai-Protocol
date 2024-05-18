import React from 'react';

const Referral = ({ referral, setReferral }) => {
  const handleChange = (e) => {
    const words = e.target.value.split(' ').filter(word => word !== '');
    if (words.length <= 6) {
      setReferral(e.target.value);
    }
  };

  return (
    <div className="bg-yellow-200 p-4 rounded-lg">
      <h2 className="text-lg font-bold">Referral</h2>
      <input
        type="text"
        className="w-full mt-2 p-2 border rounded"
        value={referral}
        onChange={handleChange}
        placeholder="Enter referral code (up to 6 words)"
      />
    </div>
  );
};

export default Referral;
