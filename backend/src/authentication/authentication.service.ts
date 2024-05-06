import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy } from 'passport-auth0';

@Injectable()
export class AuthenticationService extends PassportStrategy(Strategy, 'auth0') {
  constructor() {
    super({
      domain: process.env.AUTH0_DOMAIN,
      clientID: process.env.AUTH0_CLIENT_ID,
      clientSecret: process.env.AUTH0_CLIENT_SECRET,
      callbackURL: process.env.AUTH0_CALLBACK_URL,
      state: false,
    });
  }

  validate(
    accessToken: string,
    refreshToken: string,
    extraParams: any,
    profile: any,
    done: (err: any, user?: any, info?: any) => void,
  ): void {
    done(null, profile);
  }
}