dnl -------------------------------------------------------- -*- autoconf -*-
dnl Licensed to the Apache Software Foundation (ASF) under one or more
dnl contributor license agreements.  See the NOTICE file distributed with
dnl this work for additional information regarding copyright ownership.
dnl The ASF licenses this file to You under the Apache License, Version 2.0
dnl (the "License"); you may not use this file except in compliance with
dnl the License.  You may obtain a copy of the License at
dnl
dnl     http://www.apache.org/licenses/LICENSE-2.0
dnl
dnl Unless required by applicable law or agreed to in writing, software
dnl distributed under the License is distributed on an "AS IS" BASIS,
dnl WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
dnl See the License for the specific language governing permissions and
dnl limitations under the License.

dnl
dnl TS_ADDTO(variable, value)
dnl
dnl  Add value to variable
dnl
AC_DEFUN([TS_ADDTO], [
  if test "x$$1" = "x"; then
    test "x$verbose" = "xyes" && echo "  setting $1 to \"$2\""
    $1="$2"
  else
    ats_addto_bugger="$2"
    for i in $ats_addto_bugger; do
      ats_addto_duplicate="0"
      for j in $$1; do
        if test "x$i" = "x$j"; then
          ats_addto_duplicate="1"
          break
        fi
      done
      if test $ats_addto_duplicate = "0"; then
        test "x$verbose" = "xyes" && echo "  adding \"$i\" to $1"
        $1="$$1 $i"
      fi
    done
  fi
])dnl

dnl
dnl TS_ADDTO_RPATH(path)
dnl
dnl   Adds path to variable with the '-rpath' directive.
dnl
AC_DEFUN([TS_ADDTO_RPATH], [
  AC_MSG_NOTICE([adding $1 to RPATH])
  TS_ADDTO(LIBTOOL_LINK_FLAGS, [-R$1])
])dnl

dnl
dnl pcre.m4: Trafficserver's pcre autoconf macros
dnl

dnl
dnl ADD_FBSD_PREFIX: Adds the FreeBSD local prefix.
dnl
AC_DEFUN([ADD_FBSD_PREFIX], [
    TS_ADDTO(CFLAGS, [-I/usr/local/include])
    TS_ADDTO(LDFLAGS, [-L/usr/local/lib])
    TS_ADDTO_RPATH(/usr/local/lib)
])
