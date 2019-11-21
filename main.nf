$HOSTNAME = ""
params.outdir = 'results'  


if (!params.Input_file){params.Input_file = ""} 

g_1_txtFile_g_4 = file(params.Input_file, type: 'any') 


process Reverse_file {

publishDir params.outdir, overwrite: true, mode: 'copy',
	saveAs: {filename ->
	if (filename =~ /Output.txt$/) "Output_text_file/$filename"
}

input:
 file InputFile from g_1_txtFile_g_4

output:
 file "Output.txt"  into g_4_txtFile

"""
tac ${InputFile} > Output.txt
"""
}


workflow.onComplete {
println "##Pipeline execution summary##"
println "---------------------------"
println "##Completed at: $workflow.complete"
println "##Duration: ${workflow.duration}"
println "##Success: ${workflow.success ? 'OK' : 'failed' }"
println "##Exit status: ${workflow.exitStatus}"
}
