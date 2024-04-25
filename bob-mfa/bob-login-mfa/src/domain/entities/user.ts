export default class User {
    id: number;
    email: string;
    name: string;
    password: string;

    constructor(id: number, email: string, name: string, password: string) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.password = password;
    }
}