BEGIN { 

  # Lists
  listVolumes=0
  listZones=0
  listSecurityGroups=0
  listTemplates=0
  listDiskOffering=0
  listSnapshots=0
  listVirtualMachines=0
  listNetworkOfferings=0
  listAccounts=0


  # Creates
  createVolume=0
  createTemplate=0
  createSnapshot=0
  createNetwork=0
  deployVirtualMachine=0
  startVirtualMachine=0

  # Deletes

  destroyVirtualMachine=0
  deleteVolume=0
  deleteTemplate=0

  totalCalls=0


  FS = ":" ;

}

  #if ( $0 ~ /listVolumes/ ) && 
  #{ print key }
  ( $0 ~ key ) && ( $0 ~ /listVolumes/ ) {listVolumes+=1}
  ( $0 ~ key ) && ( $0 ~ /listZones/ ) {listZones+=1}
  ( $0 ~ key ) && ( $0 ~ /listSecurityGroups/ ) {listSecurityGroups+=1}
  ( $0 ~ key ) && ( $0 ~ /listTemplates/ ) {listTemplates+=1}
  ( $0 ~ key ) && ( $0 ~ /listDiskOffering/ ) {listDiskOffering+=1}
  ( $0 ~ key ) && ( $0 ~ /listSnapshots/ ) {listSnapshots+=1}
  ( $0 ~ key ) && ( $0 ~ /listVirtualMachines/ ) {listVirtualMachines+=1}
  ( $0 ~ key ) && ( $0 ~ /listNetworkOfferings/ ) {listNetworkOfferings+=1}
  ( $0 ~ key ) && ( $0 ~ /listAccounts/ ) {listAccounts+=1}

  ( $0 ~ key ) && ( $0 ~ /createVolume/ ) {createVolume+=1}
  ( $0 ~ key ) && ( $0 ~ /createTemplate/ ) {createTemplate+=1}
  ( $0 ~ key ) && ( $0 ~ /createSnapshot/ ) {createSnapshot+=1}
  ( $0 ~ key ) && ( $0 ~ /deployVirtualMachine/ ) {deployVirtualMachine+=1}
  ( $0 ~ key ) && ( $0 ~ /startVirtualMachine/ ) {startVirtualMachine+=1}

  ( $0 ~ key ) && ( $0 ~ /destroyVirtualMachine/ ) {destroyVirtualMachine+=1}
  ( $0 ~ key ) && ( $0 ~ /deleteVolume/ ) {deleteVolume+=1}
  ( $0 ~ key ) && ( $0 ~ /deleteTemplate/ ) {deleteTemplate+=1}


END { 

  print "\n"
  print "CloudStack API Summary for" , key;
  print "==========================================\n" ;

  totalLists=listVolumes+listZones+listSecurityGroups+listTemplates+listSnapshots+listDiskOffering+listVirtualMachines+listNetworkOfferings+listAccounts
  totalCreate=createVolume+createTemplate+createSnapshot+createNetwork+deployVirtualMachine+startVirtualMachine
  totalDelete=destroyVirtualMachine+deleteVolume+deleteTemplate

  total=totalLists+totalCreate+totalDelete

  printf "%-26s %-6d %6.2f %s\n", "List Volumes: ", listVolumes , ((listVolumes/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "List Zones: ", listZones , ((listZones/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "List SecurityGroups: ", listSecurityGroups , ((listSecurityGroups/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "List Templates: ", listTemplates , ((listTemplates/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "List Snapshots: ", listSnapshots , ((listSnapshots/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "List Disk Offering: ", listDiskOffering , ((listDiskOffering/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "List Virtual Machines: ", listVirtualMachines , ((listVirtualMachines/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "List Network Offerings: ", listNetworkOfferings , ((listNetworkOfferings/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "List Accounts: ", listAccounts , ((listNetworkAccounts/total)*100), "%"
  print "\n"
  printf "%-26s %-6d %6.2f %s\n", "Total list calls:", totalLists , ((totalLists/total)*100), "%"
  print "------------------------------------------\n" ;
  printf "%-26s %-6d %6.2f %s\n", "Create Volume: ", createVolume , ((createVolume/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "Create Template: ", createTemplate , ((createTemplate/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "Create Snapshot: ", createSnapshot , ((createSnapshot/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "Deploy Virtual Machine: ", deployVirtualMachine , ((deployVirtualMachine/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "Start Virtual Machine: ", startVirtualMachine , ((startVirtualMachine/total)*100), "%"
  print "\n"
  printf "%-26s %-6d %6.2f %s\n", "Total create calls:", totalCreate , ((totalCreate/total)*100), "%"
  print "------------------------------------------\n" ;
  printf "%-26s %-6d %6.2f %s\n", "Destroy Virtual Machine: ", destroyVirtualMachine , ((destroyVirtualMachine/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "Delete Volume: ", deleteVolume , ((deleteVolume/total)*100), "%"
  printf "%-26s %-6d %6.2f %s\n", "Delete Template: ", deleteTemplate , ((deleteTemplate/total)*100), "%"
  print "\n"

  printf "%-26s %-6d %6.2f %s\n", "Total delete calls:", totalDelete , ((deleteDelete/total)*100), "%"
  print "==========================================\n" ;
  printf "%-26s %d\n", "Total calls:", total
}
