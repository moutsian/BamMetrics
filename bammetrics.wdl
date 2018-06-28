import "tasks/samtools.wdl" as samtools

workflow BamMetrics {
    File bamFile
    File bamIndex
    String outputDir
    File refFasta
    File refDict
    File refFastaIndex

    String prefix = outputDir + "/" + basename(bamFile, ".bam")

    call samtools.Flagstat {
        input:
            inputBam = bamFile,
            outputPath = prefix + ".flagstats"
    }
}
