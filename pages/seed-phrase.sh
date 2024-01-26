htmx_page <<EOF
<p class="mt-3">$(/bin/cardano-addresses/bin/cardano-address recovery-phrase generate --size 24)</p>
EOF
