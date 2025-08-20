import { transformEntries as abapTransformEntries } from "/sales/dist/abap-transformation-executor.mjs";

export async function performTransformation(transformationId: string, entries: any[]) {

    console.log(`Executing performance testing of ${entries.length} entries using transformation with id ${transformationId}`);

    const startTime = Date.now();
    const transformedEntries = await abapTransformEntries(transformationId, entries);
    const endTime = Date.now();

    const transformationMillis = (endTime - startTime);
    console.log(`Transformation of ${entries.length} entries to ${transformedEntries.length} using transformation ${transformationId} took ${transformationMillis}ms`);
}