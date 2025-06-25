export function prettyPrintJson(obj: any) {
    return '[]'; // workaround for https://github.com/eclipse-dirigible/dirigible/issues/5157
    // return JSON.stringify(obj, null, 2);
} 