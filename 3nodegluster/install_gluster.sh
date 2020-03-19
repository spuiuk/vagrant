gluster peer probe vm145-92
gluster peer probe vm145-93
gluster peer status

gluster volume create gv0 vm145-91:/rhgs/brick-vm145-91 vm145-92:/rhgs/brick-vm145-92 vm145-93:/rhgs/brick-vm145-93 force
gluster volume info
gluster volume start gv0

#For Samba

#Samba using libgfs can communicate with gluster using insecure ports.
gluster volume set gv0 server.allow-insecure on

#Enable Samba specific caching
#This enables metadata caching to improve SMB performance
gluster volume set gv0 performance.cache-samba-metadata on

#Verify proper locks and io coherency
gluster volume set gv0 storage.batch-fsync-delay-usec 0

#You will need to stop and start the volume again for the hook scripts to run and create its entries in smb.conf
gluster volume stop gv0
gluster volume start gv0

