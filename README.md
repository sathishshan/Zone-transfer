# zonetransfer

USAGE:

./zone-t.sh domain.com

## Example Results:

### [-] The Zone Transfer is Not Enabled in the domain.
```
./zone-t.sh domain.com
zone Transfer [Failed] in ns2.domain.com. Server
zone Transfer [Failed] in ns3.domain.com. Server
zone Transfer [Failed] in ns4.domain.com. Server
zone Transfer [Failed] in ns1.domain.com. Server
```
### [+] The Zone Transfer is Enabled in the domain. 
```
./zone-t.sh zonetransfer.me
zone Transfer [SUCCESS] in nsztm1.digi.ninja. Server
DNS Retervied Data is saved in the file zonetranfer_results.md
zone Transfer [SUCCESS] in nsztm2.digi.ninja. Server
DNS Retervied Data is saved in the file zonetranfer_results.md
```
