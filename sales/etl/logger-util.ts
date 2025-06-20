import { logging } from "sdk/log";

export function getLogger(fileURL: string) {
    const loggerName = fileURL.slice(fileURL.indexOf('/public/') + 8).replaceAll('/', '.');

    const logger = logging.getLogger(loggerName);

    // enable debug to print more details like ETL entries
    // logger.setLevel("debug");

    return logger;
} 