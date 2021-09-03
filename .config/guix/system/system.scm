;; This is an operating system configuration generated
;; by the graphical installer.

(use-modules (gnu))
(use-service-modules networking ssh)

(operating-system
 (locale "en_US.utf8")
 (timezone "America/New_York")
 (keyboard-layout (keyboard-layout "us"))
 (host-name "guix-vm")
 (users (cons* (user-account
                (name "andrew")
                (comment "Andrew Parker")
                (group "users")
                (home-directory "/home/andrew")
                (supplementary-groups
                 '("wheel" "netdev" "audio" "video")))
               %base-user-accounts))
 (packages
  (append
   (list (specification->package "nss-certs"))
   %base-packages))
 (services
  (append
   (list (service dhcp-client-service-type)
         (service openssh-service-type))
   %base-services))
 (bootloader
  (bootloader-configuration
   (bootloader grub-bootloader)
   (target "/dev/sda")
   (keyboard-layout keyboard-layout)))
 (swap-devices
  (list (uuid "8e856441-424a-4350-b876-343e7e14d3a4")))
 (file-systems
  (cons* (file-system
          (mount-point "/")
          (device
           (uuid "c804f2b2-1465-4116-b022-661684a1266d"
                 'ext4))
          (type "ext4"))
         %base-file-systems)))
