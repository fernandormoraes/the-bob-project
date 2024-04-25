import Content from "../entities/content";
import Course from "../entities/course";

export default interface ICourseRepository {
    findAll(): Promise<Course[]>;
    findKeepWatching(): Promise<Content[]>;
}