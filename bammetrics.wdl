import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools

workflow BamMetrics {
    File bamFile
    File bamIndex
    String outputDir
    File refFasta
    File refDict
    File refFastaIndex

    File? refRefflat
    String? strandedness = "None"

    Boolean? targeted = false

    String prefix = outputDir + "/" + basename(bamFile, ".bam")

    call samtools.Flagstat {
        input:
            inputBam = bamFile,
            outputPath = prefix + ".flagstats"
    }

    call picard.CollectMultipleMetrics as picardMetrics {
        input:
            bamFile = bamFile,
            bamIndex = bamIndex,
            basename = prefix,
            refFasta = refFasta,
            refDict = refDict,
            refFastaIndex = refFastaIndex
    }

    if (defined(refRefflat)) {
        Map[String, String] strandednessConversion = {"None": "NONE",
            "FR":"FIRST_READ_TRANSCRIPTION_STRAND", "RF": "SECOND_READ_TRANSCRIPTION_STRAND"}

        call picard.CollectRnaSeqMetrics as rnaSeqMetrics {
            input:
                bamFile = bamFile,
                bamIndex = bamIndex,
                refRefflat = refRefflat,
                basename = prefix,
                strandSpecificity = strandednessConversion[strandedness]
        }
    }

    if (select_first([targeted])) {
        call picard.CollectTargetedPcrMetrics as targetMetrics {
            input:
                bamFile = bamFile,
                bamIndex = bamIndex,
                refFasta = refFasta,
                refDict = refDict,
                refFastaIndex = refFastaIndex,
                basename = prefix
        }
    }
}
