@echo off
rem �^�C���X�^���v�֘A
echo ----------------
echo �^�C���X�^���v
echo ----------------

rem ----------------
rem ���O�p�̎��Ԓ�`
rem ----------------

rem time�̋󔒕�����0�ɕϊ�
set time2=%time: =0%

rem dt �Ƀ^�C���X�^���v���`����
set dt=%date:~0,4%%date:~5,2%%date:~8,2%%time2:~0,2%%time2:~3,2%

echo %dt%
pause
