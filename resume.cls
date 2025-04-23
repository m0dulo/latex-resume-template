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
% 头部信息命令定义
% ============================================================================
\makeatletter
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


\renewcommand{\@printContactInfo}{
   \centerline{
     \sffamily\large{
       \ifthenelse{\isempty{\@contactWeChat}}{}{{\color{resumeblue}\faWeixin}~{\rmfamily{\@contactWeChat}}\quad} % Added icon
       \ifthenelse{\isempty{\@contactEmail}}{}{{\color{resumeblue}\faEnvelopeO}~{\rmfamily{\@contactEmail}}\quad} % Added icon
       \ifthenelse{\isempty{\@contactGithub}}{}{{\color{resumeblue}\faGithub}~\href{https://github.com/\@contactGithub}{\rmfamily{github.com/\@contactGithub}}\quad} % Added icon & link
       \ifthenelse{\isempty{\@contactEnglish}}{}{{\color{resumeblue}\faLanguage}~{\rmfamily{\@contactEnglish}}\quad} % Added icon
       \ifthenelse{\isempty{\@contactGender}}{}{{\color{resumeblue}\faUser}~{\rmfamily{\@contactGender}}} % Added icon
     }
   }
  \fi
}

% --- 姓名命令 ---
\renewcommand{\name}[1]{
      \centerline{\huge\textbf{#1}}
      \vspace{1.5ex}
      \@printContactInfo 
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
% 其他实用命令定义
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