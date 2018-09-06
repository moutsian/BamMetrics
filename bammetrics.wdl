version 1.0

import "tasks/picard.wdl" as picard
import "tasks/samtools.wdl" as samtools
import "tasks/biopet/bamstats.wdl" as bamstats

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

    call bamstats.Generate {
        input:
            bam=bamFile,
            bamIndex=bamIndex,
            reference=refFasta,
            outputDir=prefix + "_stats",
            scatterMode=false
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
        Array[File] targetBeds = select_first([targetIntervals])
        scatter (targetBed in targetBeds) {
            call picard.BedToIntervalList as targetIntervalsLists {
                input:
                    bedFile = targetBed,
                    outputPath =
                        prefix + "_intervalLists/" + basename(targetBed) + ".interval_list",
                    dict=refDict
            }
        }

        call picard.BedToIntervalList as ampliconIntervalsLists {
             input:
                 bedFile = select_first([ampliconIntervals]),
                 outputPath = prefix + "_intervalLists/" +
                    basename(select_first([ampliconIntervals])) + ".interval_list",
                 dict=refDict
            }

        call picard.CollectTargetedPcrMetrics as targetMetrics {
            input:
                bamFile = bamFile,
                bamIndex = bamIndex,
                refFasta = refFasta,
                refDict = refDict,
                refFastaIndex = refFastaIndex,
                basename = prefix,
                targetIntervals = targetIntervalsLists.intervalList,
                ampliconIntervals = ampliconIntervalsLists.intervalList
        }
    }

    output {
    }
}
