import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
import { TokenPayload } from '../models/User';

dotenv.config();

export class TokenManager {
  public createToken = (payload: TokenPayload): string => {

    const expiresIn = process.env.JWT_EXPIRES_IN || '1d'; 

    const token = jwt.sign(payload, process.env.JWT_KEY as string, {
      expiresIn,
    });
    return token;
  };

  public getPayload = (token: string): TokenPayload | null => {
    try {
      const payload = jwt.verify(token, process.env.JWT_KEY as string);
      return payload as TokenPayload;
    } catch (error) {
      return null;
    }
  };
}
