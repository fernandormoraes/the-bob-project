import { Axios } from "axios";
import User from "../domain/entities/user";
import UserRepository from "../domain/repositories/user_repository";

export default class UserRepositoryImpl implements UserRepository {
    constructor(axiosClient: Axios) {
        this.axiosClient = axiosClient;
    }

    apiEndpoint: string = "http://localhost:8888/api";

    axiosClient: Axios;

    async postSignUp(user: User): Promise<User> {
        const dto: SignUpDto = {
            email: user.email,
            name: user.name,
            password: user.password,
            username: user.email
        }

        const jsonData = JSON.stringify(dto)

        let response = await this.axiosClient.post<DefaultResponse<User>>(this.apiEndpoint + "/signup", jsonData, { headers: { 'Content-Type': 'application/json' } });

        return response.data.data;
    }

    async postSignIn(username: String, password: String): Promise<User> {
        const dto: SignInDto = {
            username: username,
            password: password
        }

        const jsonData = JSON.stringify(dto)

        let response = await this.axiosClient.post<DefaultResponse<User>>(this.apiEndpoint + "/login", jsonData, { headers: { 'Content-Type': 'application/json' } });

        return response.data.data;
    }
}