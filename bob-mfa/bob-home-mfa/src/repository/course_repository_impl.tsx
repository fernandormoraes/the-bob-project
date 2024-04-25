import Content from "../domain/entities/content";
import Course from "../domain/entities/course";
import ICourseRepository from "../domain/repositories/course_repository";

export default class CourseRepositoryImpl implements ICourseRepository {
    async findKeepWatching(): Promise<Content[]> {
        return [
            new Content(0, "Tipos primitivos em Python", "Apresentação sobre tipos em Python", "", "", "https://cdn-images-1.medium.com/max/1024/1*5__HCmQnUOJ6tms1QiQYKA.png", "", new Date(), new Date())
        ];
    }
    async findAll(): Promise<Course[]> {
        return [
            new Course(1, "Curso de Python", "https://www.freecodecamp.org/news/content/images/2022/02/Banner-10.png", []),
            new Course(2, "Curso de Java", "https://www.classcentral.com/report/wp-content/uploads/2022/05/Java-BCG-Banner.png", []),
            new Course(3, "Curso de Javascript", "https://www.classcentral.com/report/wp-content/uploads/2022/06/JavaScript-BCG-Banner-icons.png", []),
            new Course(4, "Curso de Golang", "https://i.ytimg.com/vi/3iuoQkQOx2w/hq720.jpg?sqp=-oaymwEXCK4FEIIDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD0Svdj9ygSRInXRO8wRivleFo11Q", []),
            new Course(5, "Curso de Elixir", "https://www.classcentral.com/report/wp-content/uploads/2023/01/Elixir-BCG-Banner.png", []),
            new Course(6, "Curso de Typescript", "https://www.classcentral.com/report/wp-content/uploads/2022/08/TypeScript-BCG-Banner.png", []),
            new Course(7, "Curso de Python", "https://www.freecodecamp.org/news/content/images/2022/02/Banner-10.png", []),
            new Course(8, "Curso de Java", "https://www.classcentral.com/report/wp-content/uploads/2022/05/Java-BCG-Banner.png", []),
            new Course(9, "Curso de Javascript", "https://www.classcentral.com/report/wp-content/uploads/2022/06/JavaScript-BCG-Banner-icons.png", []),
            new Course(10, "Curso de Golang", "https://i.ytimg.com/vi/3iuoQkQOx2w/hq720.jpg?sqp=-oaymwEXCK4FEIIDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD0Svdj9ygSRInXRO8wRivleFo11Q", []),
            new Course(11, "Curso de Elixir", "https://www.classcentral.com/report/wp-content/uploads/2023/01/Elixir-BCG-Banner.png", []),
            new Course(12, "Curso de Typescript", "https://www.classcentral.com/report/wp-content/uploads/2022/08/TypeScript-BCG-Banner.png", [])
        ]
    }

}