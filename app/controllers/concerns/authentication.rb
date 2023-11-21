module Authentication
  def encode_token(payload)
    expiration_time = Time.now.to_i + 100 * 24 * 60 * 60 # 100 days in seconds

    JWT.encode(payload.merge(exp: expiration_time), 'nwpqTJTbwdfU3noNeLyVF7Y3LaHsbf1nHV02OyOOFRx2b/4YbrbogWFH1V42lXSEmMgSdaAW76K+QenAt49o0A==', 'HS256')
  end

  def decode_token(token)
    JWT.decode(token, 'nwpqTJTbwdfU3noNeLyVF7Y3LaHsbf1nHV02OyOOFRx2b/4YbrbogWFH1V42lXSEmMgSdaAW76K+QenAt49o0A==', true, algorithm: 'HS256')[0]
  end
end
