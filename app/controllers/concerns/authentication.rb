module Authentication
  def encode_token(payload)
    JWT.encode(payload, 'nwpqTJTbwdfU3noNeLyVF7Y3LaHsbf1nHV02OyOOFRx2b/4YbrbogWFH1V42lXSE
mMgSdaAW76K+QenAt49o0A==', 'HS256')
  end

  def decode_token(token)
    JWT.decode(token, 'nwpqTJTbwdfU3noNeLyVF7Y3LaHsbf1nHV02OyOOFRx2b/4YbrbogWFH1V42lXSE
mMgSdaAW76K+QenAt49o0A==', true, algorithm: 'HS256')[0]
  end
end
