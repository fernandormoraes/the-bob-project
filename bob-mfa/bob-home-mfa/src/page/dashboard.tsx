import { useEffect, useRef, useState } from "react";
import GetAllCourses from "../domain/usecases/get_all_courses";
import IGetAllCourses from "../domain/usecases/get_all_courses";
import CourseRepositoryImpl from "../repository/course_repository_impl";
import Course from "../domain/entities/course";
import { Box, Button, Grid, IconButton, Typography } from "@mui/material";
import ArrowBackIosIcon from '@mui/icons-material/ArrowBackIos';
import { ArrowForwardIos } from "@mui/icons-material";
import DefaultCardCourses from "./components/default_card_courses";
import FindKeepWatching, { IFindKeepWatching } from "../domain/usecases/find_keep_watching";
import ICourseRepository from "../domain/repositories/course_repository";
import Content from "../domain/entities/content";
import DefaultCardKeepWatching from "./components/default_card_keep_watching";
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
import AnnounceCard from "./components/announce_card";

let courseRepository: ICourseRepository = new CourseRepositoryImpl()
let getAllCourses: IGetAllCourses = new GetAllCourses(courseRepository);
let findKeepWatching: IFindKeepWatching = new FindKeepWatching(courseRepository);

export default function Dashboard() {
    const [, setScrollPosition] = useState(0);
    const scrollContainerRef = useRef(null);

    const [, setScrollPositionKeepWatching] = useState(0);
    const scrollContainerRefKeepWatching = useRef(null);

    const handleScroll = (direction) => {
        if (scrollContainerRef.current) {
            const currentScrollPosition = scrollContainerRef.current.scrollLeft;
            const scrollAmount = 300; // Adjust as needed for your card width + margin

            if (direction === 'left') {
                scrollContainerRef.current.scrollLeft = currentScrollPosition - scrollAmount;
            } else {
                scrollContainerRef.current.scrollLeft = currentScrollPosition + scrollAmount;
            }

            setScrollPosition(scrollContainerRef.current.scrollLeft);
        }
    };

    const handleScrollKeepWatching = (direction) => {
        if (scrollContainerRefKeepWatching.current) {
            const currentScrollPosition = scrollContainerRefKeepWatching.current.scrollLeft;
            const scrollAmount = 300; // Adjust as needed for your card width + margin

            if (direction === 'left') {
                scrollContainerRefKeepWatching.current.scrollLeft = currentScrollPosition - scrollAmount;
            } else {
                scrollContainerRefKeepWatching.current.scrollLeft = currentScrollPosition + scrollAmount;
            }

            setScrollPositionKeepWatching(scrollContainerRefKeepWatching.current.scrollLeft);
        }
    };

    let [courses, setCourses] = useState<Course[]>([])
    let [keepWatchingContent, setKeepWatchingContent] = useState<Content[]>([])

    const [loading, setLoading] = useState(true)
    const [loadingContent, setLoadingContent] = useState(true)

    useEffect(() => {
        getAllCourses.call().then(courses => {
            setLoading(false)
            setCourses(courses)
        })

        findKeepWatching.call().then(contents => {
            setLoadingContent(false)
            setKeepWatchingContent(contents)
        })
    }, [])

    if (loading) {
        return <div>Data loading...</div>
    }

    const arrayDataItems = courses.map((course) =>
        <DefaultCardCourses data={course}></DefaultCardCourses>
    );

    const arrayDataItemsKeepWatching = keepWatchingContent.map((content) =>
        <DefaultCardKeepWatching data={content}></DefaultCardKeepWatching>
    );

    return <div>

        <Grid justifyContent="center" alignItems="center" sx={{ display: 'flex', marginX: 4, p: 2, alignItems: "center", justifyContent: "center" }}>
            <Grid item sx={{ gap: 4 }}>
                <Typography variant="h6" gutterBottom sx={{ marginBottom: 0 }}>Bob</Typography>
                <Typography variant="subtitle2" sx={{ marginTop: 0 }} gutterBottom>Your course space</Typography>
            </Grid>
            <Button sx={{ marginLeft: 8 }}><Typography variant="h6">Home</Typography></Button>
            <Button sx={{ marginLeft: 8 }}><Typography variant="h6">Categories</Typography></Button>
            <Box justifyContent="center" alignItems="center" sx={{ display: 'flex', borderRadius: 2, boxShadow: 4, alignItems: "center", justifyContent: "center", marginLeft: 12, marginTop: 2, marginBottom: 2 }}>
                <Typography sx={{ marginLeft: 2 }}>My account</Typography>
                <IconButton ><AccountCircleIcon style={{ fontSize: 50, color: "white" }} /></IconButton>
            </Box>
        </Grid>
        <AnnounceCard />

        <Box sx={{ display: 'flex', gap: 0, flexWrap: 'wrap', p: 0, marginX: 4 }}>
            <Typography sx={{ marginLeft: 4, marginBottom: 0 }} variant="h6">Next Courses</Typography>
            <Box sx={{ display: 'flex', width: 1 / 1, flexWrap: 'nowrap', marginTop: 0 }}>
                <Button onClick={() => handleScroll('left')}><ArrowBackIosIcon></ArrowBackIosIcon></Button>
                <Box ref={scrollContainerRef} sx={{
                    display: 'flex', maxHeight: 200, gap: 4, flexWrap: 'nowrap', p: 2, m: 4, boxShadow: 4, width: 1 / 1, overflowX: "scroll", '&::-webkit-scrollbar': {
                        width: 0,
                        display: 'none'
                    }, msOverflowStyle: 'none', scrollbarWidth: "none"
                }}>
                    {arrayDataItems}
                </Box><Button onClick={() => handleScroll('right')}><ArrowForwardIos></ArrowForwardIos></Button></Box></Box>

        {!loadingContent &&

            <Box sx={{ display: 'flex', gap: 0, flexWrap: 'wrap', p: 0, marginX: 4 }}>
                <Typography sx={{ marginLeft: 4, marginBottom: 0 }} variant="h6">Continue watching</Typography>
                <Box sx={{ display: 'flex', width: 1 / 1, flexWrap: 'nowrap', marginTop: 0 }}>
                    <Button onClick={() => handleScrollKeepWatching('left')}><ArrowBackIosIcon></ArrowBackIosIcon></Button>
                    <Box ref={scrollContainerRefKeepWatching} sx={{
                        display: 'flex', maxHeight: 200, gap: 4, flexWrap: 'nowrap', p: 2, m: 4, boxShadow: 4, width: 1 / 1, overflowX: "scroll", '&::-webkit-scrollbar': {
                            width: 0,
                            display: 'none'
                        }, msOverflowStyle: 'none', scrollbarWidth: "none"
                    }}>
                        {arrayDataItemsKeepWatching}
                    </Box><Button onClick={() => handleScrollKeepWatching('right')}><ArrowForwardIos></ArrowForwardIos></Button></Box></Box>
        }

    </div >;
}


