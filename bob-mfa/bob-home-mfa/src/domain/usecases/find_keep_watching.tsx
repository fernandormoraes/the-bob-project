import Content from "../entities/content";
import Course from "../entities/course";
import ICourseRepository from "../repositories/course_repository";

export interface IFindKeepWatching {
    call(): Promise<Content[]>;
}

export default class FindKeepWatching implements IFindKeepWatching {
    courseRepository: ICourseRepository;

    constructor(courseRepository: ICourseRepository) {
        this.courseRepository = courseRepository;
    }

    async call(): Promise<Content[]> {
        let contents = await this.courseRepository.findKeepWatching();

        return contents;
    }

}