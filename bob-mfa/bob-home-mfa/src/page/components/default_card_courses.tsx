import { Card, CardMedia } from "@mui/material";
import Course from "../../domain/entities/course";

export default function DefaultCardCourses(props: DefaultCardCoursesProps) {
    return (<Card key={props.data.id} sx={{ minWidth: 345, maxWidth: 345, margin: 0 }} >
        <CardMedia
            component="img"
            height="194"
            image={props.data.cover}
            alt={props.data.description} sx={{ borderRadius: 4, minWidth: 345, maxWidth: 345, margin: 0 }} />
    </Card>)
}

export interface DefaultCardCoursesProps {
    data: Course
}