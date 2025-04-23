\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2025]
\LoadClass[11pt]{article}

% ============================================================================
% 所需包导入
% ============================================================================
\RequirePackage{xltxtra}
\RequirePackage{fontspec}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{xifthen}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{fontawesome}
\RequirePackage{hyperref}
\RequirePackage{graphicx} 

% ============================================================================
% 基本设置
% ============================================================================
\setlength{\parindent}{0pt}
\definecolor{resumeblue}{RGB}{0, 86, 179}
\RequirePackage[a4paper, left=0.558in, right=0.558in, top=0.218in, bottom=0.218in, nohead, nofoot]{geometry}
\setlist{noitemsep}
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}

% ============================================================================
% 照片功能相关定义
% ============================================================================
\makeatletter
\def\@photopath{}
\newlength{\@photowidth}
\setlength{\@photowidth}{2.5cm}
\newlength{\@photospacing}
\setlength{\@photospacing}{0.5em}
\newcommand{\photo}[1]{\def\@photopath{#1}}

% ============================================================================
% 头部信息命令定义
% ============================================================================
\def\@contactWeChat{}
\def\@contactEmail{}
\def\@contactGithub{}
\def\@contactEnglish{}
\def\@contactGender{}

\newcommand{\contactInfo}[5]{
    \def\@contactWeChat{#1}
    \def\@contactEmail{#2}
    \def\@contactGithub{#3}
    \def\@contactEnglish{#4}
    \def\@contactGender{#5}
}

% --- 内部命令：打印存储的联系信息 (无照片) ---
\newcommand{\@printContactInfo}{
  \ifx\@contactEmail\@empty\else
   \centerline{
     \sffamily\large{
       \ifthenelse{\isempty{\@contactWeChat}}{}{{\color{resumeblue}\faWeixin}~{\rmfamily{\@contactWeChat}}\quad}
       \ifthenelse{\isempty{\@contactEmail}}{}{{\color{resumeblue}\faEnvelopeO}~{\rmfamily{\@contactEmail}}\quad}
       \ifthenelse{\isempty{\@contactGithub}}{}{{\color{resumeblue}\faGithub}~\href{https://github.com/\@contactGithub}{\rmfamily{github.com/\@contactGithub}}\quad}
       \ifthenelse{\isempty{\@contactEnglish}}{}{{\color{resumeblue}\faLanguage}~{\rmfamily{\@contactEnglish}}\quad}
       \ifthenelse{\isempty{\@contactGender}}{}{{\color{resumeblue}\faUser}~{\rmfamily{\@contactGender}}}
     }
   }
  \fi
}

% --- 打印带图标的联系信息 (有照片s) --
\newcommand{\@printContactInfoForPhoto}{
  \ifthenelse{\isempty{\@contactWeChat} \AND \isempty{\@contactEmail} \AND \isempty{\@contactGithub} \AND \isempty{\@contactEnglish}}{
  }{
      \sffamily\normalsize{ 
        \ifthenelse{\isempty{\@contactWeChat}}{}{{\color{resumeblue}\faWeixin}~{\rmfamily{\@contactWeChat}}\quad}
        \ifthenelse{\isempty{\@contactEmail}}{}{{\color{resumeblue}\faEnvelopeO}~{\rmfamily{\@contactEmail}}\quad}
        \ifthenelse{\isempty{\@contactGithub}}{}{{\color{resumeblue}\faGithub}~\href{https://github.com/\@contactGithub}{\rmfamily{github.com/\@contactGithub}}\quad}
        \ifthenelse{\isempty{\@contactEnglish}}{}{{\color{resumeblue}\faLanguage}~{\rmfamily{\@contactEnglish}}}
      }
  }
}

% --- 姓名命令: 优化布局 ---
\renewcommand{\name}[1]{
  \ifx\@photopath\@empty % ========== 条件：没有照片 ==========
      \centerline{\huge\textbf{#1}}
      \vspace{1.5ex}
      \@printContactInfo % 调用原始居中图标打印函数
  \else % ========== 条件：有照片 ==========
      % 创建两栏布局
      \begin{minipage}[c]{\dimexpr\textwidth-\@photowidth-\@photospacing\relax}
          % 左栏：姓名和联系信息
          \vspace{3ex} % 姓名顶部增加边距
          {\raggedright\huge\textbf{#1}\par}
          \vspace{6ex} % 姓名与联系信息之间的间距
          \raggedright\@printContactInfoForPhoto % 调用优化版带图标联系信息
      \end{minipage}%
      \hfill%
      \begin{minipage}[c]{\@photowidth}
          % 右栏：照片，垂直居中对齐
          \raggedleft\includegraphics[width=\@photowidth]{\@photopath}
      \end{minipage}
  \fi
  % --- 整个头部区域后的间距 ---
  \vspace{1ex}
}
\makeatother

% ============================================================================
% 标题与段落格式
% ============================================================================
\titleformat{\section}
  {\Large\scshape\raggedright\color{resumeblue}}
  {} {0em} {} [\color{resumeblue}\titlerule]
\titlespacing*{\section}{0cm}{*1}{*1}
\titleformat{\subsection}
  {\large\raggedright}
  {} {0em} {}
\titlespacing*{\subsection}{0cm}{*1}{*0.5}

% ============================================================================
% 其他命令
% ============================================================================
\newcommand{\datedsubsection}[3]{
  \subsection[#1]{#1 \hfill #2 \hfill #3}
}
\newcommand{\datedline}[2]{
  {\par #1 \hfill #2 \par}
}

% ============================================================================
% 文档开始/结束
% ============================================================================
\endinput