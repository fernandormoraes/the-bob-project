
import { Box, CardMedia } from "@mui/material";
import Slider from "react-slick";

export default function AnnounceCard() {
    var settings = {
        dots: true,
        infinite: false,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
    };

    return <Box sx={{ height: '10%', marginLeft: 8, marginRight: 8, marginBottom: 2, marginTop: 0 }}> <Slider {...settings}>
        <CardMedia component="img" image="https://appmaster.io/api/_files/4U8EqdZFFX2FLJukgamvKF/download/" sx={{ height: 300, borderRadius: 8 }} />
    </Slider></Box>

}