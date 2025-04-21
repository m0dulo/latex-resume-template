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

% ============================================================================
% 基本设置
% ============================================================================
\setlength{\parindent}{0pt}
\definecolor{resumeblue}{RGB}{0, 86, 179}
\RequirePackage[a4paper, left=0.558in, right=0.558in, top=0.218in, bottom=0.218in, nohead, nofoot]{geometry}
\setlist{noitemsep} % Basic list setting
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

% --- 内部命令：打印存储的联系信息 (简单文本版) ---
\newcommand{\@printContactInfo}{%
  \ifx\@contactEmail\@empty\else
   \centerline{%
     \sffamily\large{
       \ifthenelse{\isempty{\@contactWeChat}}{}{{\rmfamily{\@contactWeChat}}\quad}
       \ifthenelse{\isempty{\@contactEmail}}{}{{\rmfamily{\@contactEmail}}\quad}
       \ifthenelse{\isempty{\@contactGithub}}{}{{\rmfamily{github.com/\@contactGithub}}\quad}
       \ifthenelse{\isempty{\@contactEnglish}}{}{{\rmfamily{\@contactEnglish}}\quad}
       \ifthenelse{\isempty{\@contactGender}}{}{{\rmfamily{\@contactGender}}}
     }%
   }%
  \fi
}

% --- 姓名命令 ---
\renewcommand{\name}[1]{
      \centerline{\huge\textbf{#1}}
      \vspace{1.5ex}
      \@printContactInfo % 调用打印函数
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