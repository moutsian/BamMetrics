version 1.0

import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools

workflow BamMetrics {
    input {
        File bamFile
        File bamIndex
        String outputDir
        File refFasta
        File refDict
        File refFastaIndex

        File? refRefflat
        String strandedness = "None"

        Array[File]+? targetIntervals
        File? ampliconIntervals
    }

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
                refRefflat = select_first([refRefflat]),
                basename = prefix,
                strandSpecificity = strandednessConversion[strandedness]
        }
    }

    if (defined(targetIntervals)) {
        call picard.CollectTargetedPcrMetrics as targetMetrics {
            input:
                bamFile = bamFile,
                bamIndex = bamIndex,
                refFasta = refFasta,
                refDict = refDict,
                refFastaIndex = refFastaIndex,
                basename = prefix,
                targetIntervals = select_first([targetIntervals]),
                ampliconIntervals = select_first([ampliconIntervals])
        }
    }
}
