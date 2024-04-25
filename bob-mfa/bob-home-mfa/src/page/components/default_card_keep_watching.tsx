import { Box, Card, CardMedia, Typography } from "@mui/material";
import Content from "../../domain/entities/content";

export default function DefaultCardKeepWatching(props: DefaultCardKeepWatchingProps) {
    return (<Card key={props.data.id} sx={{ position: 'relative', minWidth: 345, maxWidth: 345, maxHeight: 400, margin: 0, flexGrow: 1 }} >
        <Box sx={{ position: 'relative' }}>
            <CardMedia
                component="img"
                height="194"
                image={props.data.cover}
                sx={{ borderRadius: 4 }} />
            <Box
                sx={{
                    position: 'absolute',
                    bottom: 0,
                    left: 0,
                    width: '100%',
                    bgcolor: 'rgba(0, 0, 0, 0.7)',
                    color: 'white',
                    padding: '10px',
                }}
            >
                <Typography variant="body2" sx={{ fontWeight: 700 }}>{props.data.title}</Typography>
            </Box>
        </Box>
    </Card>)
}

export interface DefaultCardKeepWatchingProps {
    data: Content
}