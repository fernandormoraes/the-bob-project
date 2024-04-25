import Module from "./module";

export default class Course {
    id: number;
    description: string;
    cover: string;
    modules: Module[];

    constructor(id: number, description: string, cover: string, modules: Module[]) {
        this.id = id;
        this.description = description;
        this.cover = cover;
        this.modules = modules;
    }
}