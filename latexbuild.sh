#!/bin/bash
cd template
docs=""
count=0
while [ $# != 0 ]; do
	tflag=false
	dflag=false
	t=""
	if [[ $1 ==  "-t"* ]]; then
		tflag=true
		t=`echo "$1" | sed -e 's/-t//'`
		if [ -z $t ]; then
			shift
			t="$1"
		fi
		t=${t}"-wrapper"
		shift
		cat > "$t.tex" << EOF
\\input{preamble-thesis.tex}
\\begin{document}
	\\begin{nestedsection}{$t}{main}
EOF
		count=$((count+1))
	elif [[ $1 == "-d" ]]; then
		dflag=true
		t=`echo "$2" | sed -e 's/.*\///'`
		t=${t}"-wrapper"
		cat > "$t.tex" << EOF
\\input{preamble-thesis.tex}
\\begin{document}
EOF
		count=$((count+1))
	fi

	while [[ $1 ==  "-d" ]]; do
		shift
		cat >> "$t.tex" << EOF
		\\subimport{../content/}{$1.tex}
EOF
		shift
	done;
	
	if $tflag ; then
		cat >> "$t.tex" << EOF
	\\end{nestedsection}
	\\bibliographystyle{apalike}
	\\bibliography{../bibliography}
\\end{document}
EOF
	elif $dflag ; then
		cat >> "$t.tex" << EOF
	\\input{bibliography}
\\end{document}
EOF
	fi
	
	if [[ -z $t ]]; then
		t="$1"
		count=$((count+1))
		shift
	fi

	docs="$docs $t"
done

echo \*\*\* Processing $count documents: $docs \*\*\*

for t in $docs ; do
	echo \*\*\* "$t" about to be processed \*\*\*
	make -f ../makefile DOC="$t"
	echo \*\*\* "$t" processed \*\*\*

	tFinal=`echo "$t" | sed -e 's/-wrapper$//'`
	mv "$t.pdf" "../$tFinal.pdf"
	open "../$tFinal.pdf"
	start "../$tFinal.pdf"
done
wrappers=`ls -1 *-wrapper* 2>/dev/null`
rm -f $wrappers
if [[ -n $wrappers ]] ; then
	echo \*\*\* Template files removed: $wrappers \*\*\*
fi
cd -
echo \*\*\* All documents processed, cleaning up \*\*\*
make clean
