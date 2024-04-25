import User from "../entities/user";
import UserRepository from "../repositories/user_repository";

export interface ISignUpUseCase {
    call(params: SignUpUseCaseParams): Promise<User>;
}

export class SignUpUseCase implements ISignUpUseCase {
    userRepository: UserRepository;

    constructor(userRepository: UserRepository) {
        this.userRepository = userRepository;
    }

    public async call(params: SignUpUseCaseParams): Promise<User> {
        return await this.userRepository.postSignUp(
            new User(0, params.username, params.name, params.password)
        );
    }
}

export interface SignUpUseCaseParams {
    username: string;
    password: string;
    name: string;
}