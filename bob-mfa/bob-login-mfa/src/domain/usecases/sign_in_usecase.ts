import User from "../entities/user";
import UserRepository from "../repositories/user_repository";

export interface ISignInUseCase {
    call(params: SignInUseCaseParams): Promise<User>;
}

export class SignInUseCase implements ISignInUseCase {
    userRepository: UserRepository;

    constructor(userRepository: UserRepository) {
        this.userRepository = userRepository;
    }

    public async call(params: SignInUseCaseParams): Promise<User> {
        return await this.userRepository.postSignIn(params.username, params.password);
    }
}

export interface SignInUseCaseParams {
    username: string;
    password: string;
}