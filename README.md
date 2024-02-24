Using the script for create hosts for Check Point R80.x mgmt_cli
#===============================================================================
#
#         FILE: add_host_xlsx_R80.pl
#
#        USAGE: $ sudo dnf install perl-App-cpanminus
#        		$ cpanm Spreadsheet::ParseExcel Spreadsheet::XLSX Spreadsheet::Read
#
#               $./add_host_xlsx_R80.pl in_hosts.xlsx
#
#		$ cat ./add_host_R80.txt'
#		  add host name "comp01.domain.net" ip-address 10.1.1.1 --version 1.3 --format json
#		  add host name "comp02.domain.net" ip-address 10.2.2.2 --version 1.3 --format json
#		  add host name "comp03.domain.net" ip-address 10.3.3.3 --version 1.3 --format json
#		  add host name "comp04.domain.net" ip-address 10.4.4.4 --version 1.3 --format json
#
#  DESCRIPTION: Create hosts for Check Point R80.x mgmt_cli
#
#      OPTIONS: ---
# REQUIREMENTS: Perl v5.14+ 
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladislav Sapunov 
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 13.02.2024 22:22:08
#     REVISION: ---
#===============================================================================
