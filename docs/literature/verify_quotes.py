"""Check that every verbatim quote in a notes file occurs in the full texts.
usage: python3 -I verify_quotes.py NOTES.md PAPERS_DIR
Quotes = text inside double quotes (straight or curly) with >= 25 chars.
Elisions (... or …) split a quote into fragments; each fragment >= 15 chars
must be found. Matching ignores whitespace, hyphenation, case, and
non-alphanumeric characters."""
import re, sys, os, subprocess, unicodedata
notes, pdir = sys.argv[1], sys.argv[2]
def norm(s):
    s = unicodedata.normalize('NFKC', s)
    s = s.replace('-\n', '').replace('ﬁ', 'fi').replace('ﬂ', 'fl')
    s = s.lower()
    return re.sub(r'[^a-z0-9]+', '', s)
corpus = {}
for f in sorted(os.listdir(pdir)):
    if f.endswith('.pdf'):
        p = os.path.join(pdir, f)
        raw = subprocess.run(['pdftotext', '-raw', p, '-'], capture_output=True, text=True).stdout
        lay = subprocess.run(['pdftotext', '-layout', p, '-'], capture_output=True, text=True).stdout
        corpus[f] = norm(raw) + '|' + norm(lay)
text = open(notes, encoding='utf-8').read()
quotes = re.findall(r'["“]([^"”\n]{25,}?)["”]', text)
bad = 0; n = 0
for q in quotes:
    frags = [x for x in re.split(r'\.\.\.|…|\[\.\.\.\]', q) if len(norm(x)) >= 15]
    if not frags: continue
    n += 1
    ok = all(any(norm(fr) in c for c in corpus.values()) for fr in frags)
    if not ok:
        bad += 1
        print('NOT FOUND:', q[:150])
print(f'{notes}: {n} quotes checked, {bad} not found')
