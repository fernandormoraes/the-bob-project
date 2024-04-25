export default class Content {
    id: number;
    title: string;
    subtitle: string;
    description: string;
    video: string;
    cover: string;
    attachment: string;
    createdAt: Date;
    updatedAt: Date;

    constructor(id: number, title: string, subtitle: string, description: string, video: string, cover: string, attachment: string, createdAt: Date, updatedAt: Date) {
        this.id = id;
        this.title = title;
        this.subtitle = subtitle;
        this.description = description;
        this.video = video;
        this.cover = cover;
        this.attachment = attachment;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
}