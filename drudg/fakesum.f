      subroutine fakesum
C
C     FAKESUM makes a fake LVEX output from the schedule.
C
C 000110 nrv New.
C 000818 nrv New scan name format.
C 001114 nrv Scan names are character now.

      include '../skdrincl/skparm.ftni'
      include 'drcom.ftni'
      include '../skdrincl/statn.ftni'
      include '../skdrincl/sourc.ftni'
      include '../skdrincl/freqs.ftni'
      include '../skdrincl/skobs.ftni'
C
C LOCAL:
      integer*2 LSNAME(max_sorlen/2),LSTN(MAX_STN),LCABLE(MAX_STN),
     .LMON(2),
     . LDAY(2),LMID(3),LPRE(3),LPST(3),LDIR(MAX_STN)
      integer ipas(max_stn),ift(max_stn),idur(max_stn),
     .ioff(max_stn)
      integer ipasp,iftold,idirp,idir,ituse,idum,lnobs,il,ilen,ihead
      character*8 cstn
      character*128 csor
      character*2 cid
      character*18 cstart,cstop
      character*128 scan_id
      integer i,id
      double precision gst,ut
      real speed
      integer iyr,idayr,ihr,imin,isc,mjd,mon,ida,ical,icod,
     .iyr2,idayr2,ihr2,min2,isc2
      integer*2 lfreq
      integer nstnsk,istnsk,isor
      integer ierr
      INTEGER IC, TRIMLEN
      integer iflch,ichcm_ch,ichmv  ! functions
C
C INITIALIZED:
      DATA IPASP/-1/, IFTOLD/0/, IDIRP/0/
C
      call lv_open(ierr) ! get output file name
      call hol2char(lstnna(1,istn),1,8,cstn)
      il=trimlen(cstn)
      call hol2char(lpocod(istn),1,2,cid)
      write(lu_outfile,9100) cstn(1:il),cid
9100  format("*FAKE Summary for ",a". Station ID ",a2,".")
      write(lu_outfile,9101) cid,cstn(1:il)
9101  format("*"/
     .       "  def ",a2,";    * ",a)

      ic=trimlen(lskdfi)
      WRITE(LUSCN,100) (LSTNNA(I,ISTN),I=1,4),LSKDFI(1:ic) ! new
100   FORMAT(' FAKEsum output for ',4A2,' from schedule ',A) 

      ituse=1
      lnobs=0
      call ifill(ibuf,1,ibuf_len*2,oblank)
      if (lnobs+1.le.nobs) then
        idum = ichmv(ibuf,1,lskobs(1,iskrec(lnobs+1)),1,ibuf_len*2)
        ilen = iflch(ibuf,ibuf_len*2)
      else
        ilen=-1
      endif
      do while (ilen.gt.0)
        CALL UNPSK(IBUF,ILEN,LSNAME,ICAL,
     .     LFREQ,IPAS,LDIR,IFT,LPRE,
     .     IYR,IDAYR,IHR,iMIN,ISC,IDUR,LMID,LPST,
     .     NSTNSK,LSTN,LCABLE,
     .     MJD,UT,GST,MON,IDA,LMON,LDAY,IERR,KFLG,ioff)
        CALL CKOBS(LSNAME,LSTN,NSTNSK,LFREQ,ISOR,ISTNSK,ICOD)
        IF (ISOR.EQ.0.OR.ICOD.EQ.0) return
C
        IF (ISTNSK.NE.0)  THEN
C THEN BEGIN Current station in observation
          write(cstart,'(i4,"y",i3.3,"d",i2.2,"h",i2.2,"m",i2.2,"s")')
     .     iyr,idayr,ihr,imin,isc
          ID=IDUR(ISTNSK)
          CALL TMADD(IYR,IDAYR,IHR,iMIN,ISC,ID,
     .               IYR2,IDAYR2,IHR2,MIN2,ISC2)
          write(cstop,'(i4,"y",i3.3,"d",i2.2,"h",i2.2,"m",i2.2,"s")')
     .    iyr2,idayr2,ihr2,min2,isc2
          idir=1
          if (ichcm_ch(ldir(istnsk),1,'R').eq.0) idir=-1
          IFTOLD = IFT(ISTNSK)+IFIX(IDIR*(ituse*ITEARL(istn)+
     .      IDUR(ISTNSK)) *speed(icod,istn))
               IHEAD=ihdpos(1,IPAS(ISTNSK),istn,icod)
C       Create scan ID from start time and source
C       ddd-hhmm_source
C       Use scan IDs already generated.
C       write(scan_id,'(i3.3,"-",2i2.2,"_",20a2)') idayr,ihr,imin,
C    .  (lsname(i),i=1,max_sorlen/2)
C       write(scan_id,'(5a2)') (scan_name(i,lnobs+1),i=1,5)
        scan_id = scan_name(lnobs+1)
        il=trimlen(scan_id)
        write(lu_outfile,'("    scan ",a,";")') scan_id(1:il)
C       write(lu_outfile,'("    scan ",5a2,";")')
C    .      (scan_name(i,lnobs+1),i=1,5)
        write(lu_outfile,'("      VSN = unknown;")')
        write(lu_outfile,'("      head_pos = ",i5," um;")') ihead
        write(lu_outfile,'("      start_tape = ",a," : ",i5.5,
     .  " ft : 0 in/sec;")') cstart,ift(istnsk)
        write(lu_outfile,'("      stop_tape = ",a," : ",i5.5,
     .  " ft ;")') cstop,iftold
        call hol2char(lsorna(1,isor),1,max_sorlen,csor)
        il=trimlen(csor)
        write(lu_outfile,'("      source = ",a,";")') csor(1:il)
        write(lu_outfile,'("    endscan;")')
        endif
        LNOBS = LNOBS + 1
        call ifill(ibuf,1,ibuf_len*2,oblank)
        if (lnobs+1.le.nobs) then
          idum = ichmv(ibuf,1,lskobs(1,iskrec(lnobs+1)),1,ibuf_len*2)
          ilen = iflch(ibuf,ibuf_len*2)
        else
          ilen=-1
        endif
      ENDDO
      close(lu_outfile)
C
      RETURN
      END