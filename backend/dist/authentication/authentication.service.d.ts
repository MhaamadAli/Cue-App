declare const AuthenticationService_base: any;
export declare class AuthenticationService extends AuthenticationService_base {
    constructor();
    validate(accessToken: string, refreshToken: string, extraParams: any, profile: any, done: (err: any, user?: any, info?: any) => void): void;
}
export {};
