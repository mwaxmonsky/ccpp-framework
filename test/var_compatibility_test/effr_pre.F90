!Test unit conversions for intent in, inout, out variables
!

module mod_effr_pre

   use ccpp_kinds, only: kind_phys

   implicit none
   private

   public :: effr_pre_run, effr_pre_init

contains
   !> \section arg_table_effr_pre_init Argument Table
   !! \htmlinclude arg_table_effr_pre_init.html
   !!
   subroutine effr_pre_init(scheme_order, errmsg, errflg)
     character(len=512), intent(out)   :: errmsg
     integer,            intent(out)   :: errflg
     integer,            intent(inout) :: scheme_order

     errmsg = ''
     errflg = 0

     if (scheme_order .ne. 1) then
        errflg = 1
        errmsg = 'ERROR: effr_pre_init() needs to be called first'
        return
     else
        scheme_order = scheme_order + 1
     endif

   end subroutine effr_pre_init

   !> \section arg_table_effr_pre_run  Argument Table
   !! \htmlinclude arg_table_effr_pre_run.html
   !!
   subroutine effr_pre_run( effrr_inout, scalar_var,  errmsg, errflg)

      real(kind_phys),    intent(inout) :: effrr_inout(:,:)
      real(kind_phys),    intent(in)    :: scalar_var
      character(len=512), intent(out)   :: errmsg
      integer,            intent(out)   :: errflg
      !----------------------------------------------------------------
      real(kind_phys) :: effrr_min, effrr_max

      errmsg = ''
      errflg = 0

      ! Do some pre-processing on effrr...
      effrr_inout(:,:) = effrr_inout(:,:)*1._kind_phys

      if (scalar_var .ne. 273.15) then
         errmsg = 'ERROR: effr_pre_run():  scalar_var should be 273.15'
         errflg = 1
      endif

   end subroutine effr_pre_run

end module mod_effr_pre
