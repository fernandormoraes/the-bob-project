import User from "../entities/user";

export default interface UserRepository {
    postSignUp(user: User): Promise<User>;
    postSignIn(username: String, password: String): Promise<User>;
}