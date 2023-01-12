configfile: "config.yaml"

with open(config['BARCODES']) as fp:
    BARCODES= fp.read().splitlines()
print(BARCODES)



rule all:
      input:
            "nomatch.fq" 
rule demultiplex: 
     input: 
        r1 = config['SAMPLE'], 
     params: 
        names = config['NAMES']
     output: 
         "nomatch.fq" 
     shell: 
      """
      demuxbyname.sh in={input.r1} out=out_%.fq  names={params.names}, prefixmode=f -Xmx=10g outu={output} 
      """ 
