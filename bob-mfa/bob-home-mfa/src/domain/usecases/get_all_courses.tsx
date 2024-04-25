import Course from "../entities/course";
import ICourseRepository from "../repositories/course_repository";

export interface IGetAllCourses {
    call(): Promise<Course[]>;
}

export default class GetAllCourses implements IGetAllCourses {
    courseRepository: ICourseRepository;

    constructor(courseRepository: ICourseRepository) {
        this.courseRepository = courseRepository;
    }

    async call(): Promise<Course[]> {
        let courses = await this.courseRepository.findAll();

        return courses;
    }

}