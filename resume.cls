\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{resume}[2025/04/22 v1.32 Re-attempt Uppercase Title] 
\LoadClass[11pt]{article}

% ============================================================================
% 所需包导入
% ============================================================================
\RequirePackage{xltxtra} 
\RequirePackage{xifthen} 
\RequirePackage{fontawesome} 
\RequirePackage[usenames,dvipsnames]{xcolor} 
\RequirePackage{fontspec} 
\RequirePackage{titlesec} 
\RequirePackage{enumitem} 
\RequirePackage{hyperref} 
\RequirePackage{graphicx} 
\RequirePackage{calc} 
\RequirePackage{textcase}

% ============================================================================
% 基本设置
% ============================================================================
\setlength{\parindent}{0pt} 
\definecolor{resumeblue}{RGB}{0, 86, 179} 
\setmainfont[SmallCapsFont = Fontin-SmallCaps]{TeX Gyre Termes} 
\RequirePackage[a4paper, left=0.5in, right=0.5in, top=0.218in, bottom=0.218in, nohead, nofoot]{geometry}
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

\renewcommand{\contactInfo}[5]{
    \def\@contactWeChat{#1}
    \def\@contactEmail{#2}
    \def\@contactGithub{#3}
    \def\@contactEnglish{#4}
    \def\@contactGender{#5}
}

% --- 打印存储的联系信息 (无照片版) ---
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

% --- 打印带图标的联系信息 (有照片版, 无性别) ---
\newcommand{\@printContactInfoForPhoto}{
  \ifthenelse{\isempty{\@contactWeChat} \AND \isempty{\@contactEmail} \AND \isempty{\@contactGithub} \AND \isempty{\@contactEnglish}}{
  }{
      \sffamily\large{
        \ifthenelse{\isempty{\@contactWeChat}}{}{{\color{resumeblue}\faWeixin}~{\rmfamily{\@contactWeChat}}\quad}
        \ifthenelse{\isempty{\@contactEmail}}{}{{\color{resumeblue}\faEnvelopeO}~{\rmfamily{\@contactEmail}}\quad}
        \ifthenelse{\isempty{\@contactGithub}}{}{{\color{resumeblue}\faGithub}~\href{https://github.com/\@contactGithub}{\rmfamily{github.com/\@contactGithub}}\quad}
        \ifthenelse{\isempty{\@contactEnglish}}{}{{\color{resumeblue}\faLanguage}~{\rmfamily{\@contactEnglish}}}
      }
  }
}

% --- 姓名命令 ---
\renewcommand{\name}[1]{
  \ifx\@photopath\@empty % ========== 没有照片 ==========
      \centerline{\huge\textbf{#1}}
      \vspace{3ex}
      \@printContactInfo 
  \else % ========== 有照片 ==========
      % 两栏布局
      \begin{minipage}[c]{\dimexpr\textwidth-\@photowidth-\@photospacing\relax}
          \vspace{0pt} 
          {\raggedright\huge\textbf{#1}\par}
          \vspace{6ex} 
          \raggedright\@printContactInfoForPhoto 
      \end{minipage}
      \hfill
      \begin{minipage}[c]{\@photowidth}
          \includegraphics[width=\@photowidth]{\@photopath}
      \end{minipage}
      \par 
  \fi
  \vspace{1ex} 
}


% ============================================================================
% 标题与段落格式 
% ============================================================================
\titleformat{\section}
  {\Large\bfseries\raggedright\color{resumeblue}} 
  {} {0em} {} [\color{resumeblue}\titlerule] 
\titlespacing*{\section}{0cm}{*1}{*1} 
\titleformat{\subsection}
  {\large\raggedright} 
  {} {0em} {} 
\titlespacing*{\subsection}{0cm}{*1}{*0.5} 

% ============================================================================
% 其他实用命令定义 
% ============================================================================
\renewcommand{\datedsubsection}[3]{ 
  \subsection[#1]{#1 \hfill #2 \hfill #3} 
}
\newcommand{\datedline}[2]{ 
  {\par #1 \hfill #2 \par} 
}
\newcommand{\objective}[2]{ 
  \centerline{ 
    \sffamily\large{ 
      {\color{resumeblue}\faLaptop}\hspace{0.5em}\textbf{求职意向：}{#1}
      \quad 
      \ifthenelse{\isempty{#2}}{}{
        {\color{resumeblue}\faHourglassHalf}\hspace{0.5em}\textbf{实习时长：}{\textit{#2}} 
      } 
    } 
  } 
  \vspace{1ex} 
  \rmfamily 
}


\newcommand{\iconsection}[3]{
  \section{{\color{resumeblue}#1}\ {#2}\ (\MakeUppercase{#3})}
}


\makeatother